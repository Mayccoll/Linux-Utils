# youtube-dl

https://github.com/rg3/youtube-dl
http://rg3.github.io/youtube-dl/download.html

### Install

```bash
$ sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
$ sudo chmod a+rx /usr/local/bin/youtube-dl
```

### Descargar multiples videos

```bash
youtube-dl --extract-audio --audio-format mp3  "{URL}"
youtube-dl --title {URL}
youtube-dl -o "%(title)s.%(ext)s"  {URL}
youtube-dl --get-filename --date {DATE-Y-M-D} -o "%(title)s.%(ext)s" '{URL}'

```



## Lista de links


youtube-dl -a youtube_links.txt {URL}




### Opciones

```bash
--playlist-start=N --playlist-end=N
--simulate
--get-filename
-e, --get-title
--auto-number
--datebefore DATE
--dateafter DATE
--match-title REGEX
-A, --auto-number
-w, --no-overwrites
-o, --output TEMPLATE
    "%(title)s.%(ext)s"
--max-quality FORMAT
-F, --list-formats
-f, --format FORMAT
    43 - WebM video at 480p:
    45 - WebM video at 720p:
    18 - H264 video in MP4 container at 480p:
    22 - H264 video in MP4 container at 720p:
    37 - H264 video in MP4 container at 1080p:
    34 - H264 video in FLV container at 360p:
    35 - H264 video in FLV container at 480p:
     5 - H263 video at 240p:
    17 - 3GP video:
```



### Examples

```bash
 # Start with Git */
youtube-dl -w --match-title ^Git -o "%(title)s.%(ext)s" 'http://www.youtube.com/user/acinteractivedesign/videos'

 # SIMULATE */
youtube-dl -e --match-title ^Git 'http://www.youtube.com/user/acinteractivedesign/videos'

 #  SIMULATE - Get title */
youtube-dl --get-filename 'http://www.youtube.com/user/acinteractivedesign/videos'

 # SIMULATE - Between Dates */
youtube-dl -e --datebefore 20130905 --dateafter 20130108 'http://www.youtube.com/user/acinteractivedesign/videos'

 # Between Dates */
youtube-dl -w -o "%(title)s.%(ext)s" --datebefore 20130905 --dateafter 20130108 'http://www.youtube.com/user/acinteractivedesign/videos'
```
