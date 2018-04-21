Plugin.create(:show_tweet) do
  on_window_created do |i_wnd|
    @i_main_wnd = i_wnd
  end

  def main_window
    Plugin.filtering(:gui_get_gtk_widget, @i_main_wnd).first
  end

  on_show_tweet do |id|
    Thread.new{
      Message.findbyid(id)
    }.next {|msg|
      slug = :"show_tweet_#{id}"
      tab slug, "ツイート" do
        set_deletable true
        set_icon Skin.get("list.png")
        temporary_tab
        timeline slug
      end
      timeline(slug) << msg
      timeline(slug).active!
    }.terminate {|e|
      activity :error, "ﾂｲｰﾖが取得できませんでした", description: "#{e.to_s}\n#{e.backtrace.join("\n")}"
    }
  end

  command(:open_tweet_url_dialog,
    name: 'URL指定でツイートを表示',
    condition: lambda{|opt| true},
    visible: true,
    icon: File.join(File.dirname(__FILE__),"show_tweet.png"),
    role: :window) do |opt|

    dlg = Gtk::Dialog.new("ツイートのURL",
            main_window,
            Gtk::Dialog::MODAL,
            [Gtk::Stock::OK, Gtk::Dialog::RESPONSE_OK],
            [Gtk::Stock::CANCEL, Gtk::Dialog::RESPONSE_CANCEL])
    begin
      entry = Gtk::Entry.new
      dlg.vbox.add(entry)
      dlg.show_all

      if dlg.run == Gtk::Dialog::RESPONSE_OK
        url = entry.text
        # Be robust ;)
        if m = url.match(/\d+$/)
          Plugin.call(:show_tweet, m[0].to_i)
        end
      end
    ensure
      dlg.destroy
    end
  end
end
