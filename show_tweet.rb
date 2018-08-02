Plugin.create(:show_tweet) do
  on_show_tweet do |id|
    Thread.new{
      Message.findbyid(id)
    }.next{ |messages|
      if messages.is_a? Enumerable
        messages = messages.compact
      else
        messages = [messages]
      end
      Plugin.call(:open_smartthread, messages)
    }
  end

  command(:open_tweet_url_dialog,
    name: 'URL指定でツイートを表示',
    condition: lambda{|opt| true},
    visible: true,
    icon: File.join(File.dirname(__FILE__),"show_tweet.png"),
    role: :window) do |opt|

    dialog "ツイートのURL" do
      input "URL", :url
    end.next do |result|
      url = Diva::URI.new(result[:url])
      model_class = Enumerator.new{ |y|
        Plugin.filtering(:model_of_uri, url, y)
      }.lazy.map{ |model_slug|
        Diva::Model(model_slug)
      }.find{ |mc|
        mc.spec.timeline
      }
      Delayer.Deferred.new{
        model_class.find_by_uri(url)
      }.next{ |message|
        Plugin.call(:open_smartthread, [message])
      }
    end
  end
end
