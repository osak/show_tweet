# show_tweet

## Howto
    $ git clone https://github.com/osak/show_tweet.git ~/.mikutter/plugin

右下にボタンが追加されるので、押すとURLを入力するダイアログが出ます。
TweetのPermalinkや、そんな感じに見えるものを入力してOKを押すと、新しいタブでそのツイートが開けます。

試してみたい？ここにツイートのURLがあるじゃろ

https://twitter.com/toshi_a/status/43341783446466560

## For plugin developers

    Plugin.call(:show_tweet, 43341783446466560)

とか

    Plugin.call(:show_tweet, [2525213939, 3939252521])

みたいにすると、ダイアログを介さずに直接指定したやつが開けます。

## Memo
気に入ったらいい感じのアイコンを描いてもらえると喜びます。

## License
Copyright (c) 2015 Osamu Koga(osa_k)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
