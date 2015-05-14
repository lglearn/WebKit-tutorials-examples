Minimal example of WebKit2 (with GTK3) usage with web-extensions.
---------------------------------

5 examples are provided: 2 minimal examples of web-extensions (in Vala & C) and 3 minimal examples of GUIs that load web-extensions (in Vala, Python3 & C).

To use the examples, you must first compile the Web-Extensions. Then compile the GUI example (except for Python of course).
You must then copy at least one of the generated Web-Extension in the directory from which you will start the GUIs (they look for the extension in the *current* directory).

All the instructions suppose that you are under Linux (or equivalent) and run a shell (console).

## WebKit2 Web-Extensions examples
 
2 web-extension examples are provided: in Vala, and C (```c_web_extension``` directory).

Note: currently, it is not possible to write the web-extensions in Python, because it lacks the introspections files. Once they'll be available, it should be possible to create the required shared library (.so file) using Cython.

#### Vala Web-Extension
You must compile the Vala file, the compilation option are provided on the first line of the file.

 Check that the file ```webkit2_webextension_minimal_so.so``` has been generated.

#### C Web-Extension
The C example uses its own directory as it generates many files.

To compile the C example, go in the ```c_web_extension``` directory. Compile the code using the Makefile (type the command ```make```), ignore the warnings about unused parameters, they are normal.

Check that the file ```c_web_extension/bin/Release/webkit2_web_extension.so``` has been generated.

You can now copy it in the directory where the GUIs are located.

## GUI examples using the Web-extensions

#### Vala GUI
You must compile the Vala file, the compilation option are provided on the first line of the file.

#### Python GUI
No compilation step necessary.

#### C GUI
The C example uses its own directory as it generates many files.

To compile the C example, go in the ```c_gui_example``` directory. Compile the code using the Makefile (type the command ```make```), ignore the warnings about unused parameters, they are normal.

Check that the file  ```bin/Release/gtk3_webkit2_web_extensions``` has been generated.


## Testing

When you run ```./webkit2_webextension_minimal_gui``` or ```python3 py_webkit2_webextension_minimal_gui.py```, or ```c_gui_example/bin/Release/gtk3_webkit2_web_extensions```
they should access the generated file ```webkit2_webextension_minimal_so.so``` (and ```webkit2_web_extension.so``` if you copied it) and run its method.

For the purpose of the example, the URL "http://www.google.com" &amp; all the request starting by "data" (usually images) are blocked.

When running the programs you should see these messages (notice the [REJECTED] strings).
If more than one Web-Extension file (.so) is present, there will be several sets of messages.

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
