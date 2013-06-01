### Description
 (Japanese follows English).

Welcome to the Unicode Jungle!

Unlike (old) C, Ruby allows not only ASCII characters but also Unicode characters in source files. It unchains the power and the might of the monster lurking in Unicode.

The code looks easy-to-read, but strange Unicode behaviours are hard to detect like phishing (or ghotiing). You will doubt everything you read.

Once you run the code, you'll see storms caused by the rage like when you read ugly codes that have been maintained longer than you have been alive.

----

單一符號文字阿鼻へ、よくこそ來りつれ。椎と異なり、紅玉にては情報交換用米利堅標準符號のみにてはなく單一符號文字も原始符牒に使ふことせらる。此のこと單一符號文字に潛む物怪の力と勢ひ解き放つ。

此の符牒は讀みやすひごとく見ゆれど、單一符號文字の奇妙なる動き見破ることは鈞りのごとく難し。讀むもの萬疑ふごとくなるならむ。

此の符牒動かしせば、まるにておのが身の人生より長くてづから入れせられき醜有り符牒讀みし時のごとき怒りによとは引き起こされし樣なる嵐見るならむ。

### Usage

    ruby entry.rb

### Portability

I've tested with the followings.

* ruby 2.0.0p0 (2013-02-24 revision 39474) [x86\_64-darwin12.2.1]
* ruby 1.9.3p392 (2013-02-22 revision 39386) [x86\_64-darwin12.2.1]
* ruby 1.9.3p194 (2012-04-20 revision 35410) [i686-linux]
* ruby 2.0.0p0 (2013-02-24) [x64-mingw32]

It does not work with Ruby 1.8.\*. I strongly recommend the default terminal of OS X so that you'll get more funny thing from it than the others. With Windows, you can run it. But it goes wrong because of some command prompt's futures. Try to save STDOUT and open it with your text editor.

### Obfuscations

The program structure is really simple. But you must know

* features of Unicode
  + Combining characters
  + Non-printing characters (Control characters)
  + Graphically similar characters
* features of Ruby
  + Unicode variable/method names
  + Behaiviors of String, Array, Integer and Kernel
  + Literals

### Limitations

It requires the following things.

* a Unicode-supporting font 
* a text editor supporting Unicode
* a terminal supporting Unicode

Most recent OSs support these things.
