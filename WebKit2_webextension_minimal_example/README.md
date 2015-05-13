Minimal example of WebKit2 (with GTK3) usage with web-extensions.
---------------------------------

3 files are provided: a minimal example of web-extension (in Vala) and 3 demos of GUI that load web-extensions (in Vala, Python3 & C).

You must compile the Vala files, the compilation option are provided on the first line of each file.

The C example uses its own directory as it generates many files.

[Using Linux, start a shell] Compile this code using the Makefile (type the command ```'make'```), ignore the warnings about unused parameters, they are normal.

Copy the generated ```webkit2_webextension_minimal_so.so``` file in ```c_gui_example```.
Then run the program (type the command ```'./bin/Release/gtk3_webkit2_web_extensions'```).

The web-extension is using Vala, but you could use other languages (like C).

Note: currently, it is not possible to write the web-extensions in Python, because it lacks the introspections files. Once they'll be available, it should be possible to create the required shared library (.so file) using Cython.

When you run "webkit2_webextension_minimal_gui" or "py_webkit2_webextension_minimal_gui.py",
they should access the generated file "webkit2_webextension_minimal_so.so"
and run its method.

For the purpose of the example, the URL "http://www.google.com" &amp; all the request starting by "data" (usually images) are blocked.

When running the programs you should see these messages (notice the [REJECTED] strings):

```
$ ./webkit2_webextension_minimal_gui
SIGNAL: initialize-web-extensions (webkit2_webextension_minimal) 
[webkit2_webextension_minimal_so.so] PLUGIN activated
[webkit2_webextension_minimal_so.so] SIGNAL: page_created
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/empty.css
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:text/javascript,d1%20%3D%20'one'%3B
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:text/javascript;base64,ZDIgPSAndHdvJzs%3D
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:text/javascript;base64,%5a%44%4d%67%50%53%41%6e%64%47%68%79%5a%57%55%6e%4f%77%3D%3D
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:text/javascript;base64,%20ZD%20Qg%0D%0APS%20An%20Zm91cic%0D%0A%207%20
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:text/javascript,d5%20%3D%20'five%5Cu0027s'%3B
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:text/javascript,d1%20%3D%20'one'%3B
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:text/javascript;base64,ZDIgPSAndHdvJzs%3D
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:text/javascript;base64,%5a%44%4d%67%50%53%41%6e%64%47%68%79%5a%57%55%6e%4f%77%3D%3D
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:text/javascript;base64,%20ZD%20Qg%0D%0APS%20An%20Zm91cic%0D%0A%207%20
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:text/javascript,d5%20%3D%20'five%5Cu0027s'%3B
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/empty.png
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/empty.txt
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/empty.html
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAIAAAAC64paAAAABGdBTUEAAK%2FINwWK6QAAAAlwSFlzAAAASAAAAEgARslrPgAAABtJREFUOMtj%2FM9APmCiQO%2Bo5lHNo5pHNVNBMwAinAEnIWw89gAAACJ6VFh0U29mdHdhcmUAAHjac0zJT0pV8MxNTE8NSk1MqQQAL5wF1K4MqU0AAAAASUVORK5CYII%3D
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAIAAAAC64paAAAABGdBTUEAAK%2FINwWK6QAAAAlwSFlzAAAASAAAAEgARslrPgAAABtJREFUOMtj%2FM9APmCiQO%2Bo5lHNo5pHNVNBMwAinAEnIWw89gAAACJ6VFh0U29mdHdhcmUAAHjac0zJT0pV8MxNTE8NSk1MqQQAL5wF1K4MqU0AAAAASUVORK5CYII%3D
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/font.ttf
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/support-a.png
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/empty.html?1431368292597
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/svg.xml
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/empty.xml
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/empty.html
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/xhtml.1
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/xhtml.2
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/xhtml.3
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:text/css,text%7Bfont-family%3AACID3svgfont%7D
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/font.svg#mini
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:text/css,text%7Bfont-family%3AACID3svgfont%7D
[webkit2_webextension_minimal_so.so] SIGNAL: send request [REJECTED] data:image/gif;base64,R0lGODlhAQABAID%2FAMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw%3D%3D
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/support-b.png
[webkit2_webextension_minimal_so.so] SIGNAL: send request http://acid3.acidtests.org/support-b.png
```
