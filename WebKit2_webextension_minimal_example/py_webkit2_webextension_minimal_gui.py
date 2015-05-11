import gi
gi.require_version('WebKit', '3.0')
from gi.repository import Gtk, WebKit2


URI = "http://acid3.acidtests.org/"

class Webkit2_win(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="WebKit2 web-extension demo")

        self.view = WebKit2.WebView()

        self.vbox = Gtk.Box(orientation=Gtk.STYLE_CLASS_VERTICAL)
        self.vbox.expand = True
        self.vbox.set_spacing(10)

        self.menu = Gtk.Box(orientation=Gtk.STYLE_CLASS_HORIZONTAL)
        self.menu.expand = False
        self.entry_chunk_size = Gtk.Entry()
        self.entry_chunk_size.set_text(URI)
        self.entry_chunk_size.set_width_chars(48)
        self.menu.add(self.entry_chunk_size)

        self.file_read_chunk = Gtk.Button("  Go  ")
        self.file_read_chunk.connect("clicked", self.on_change_uri)
        self.menu.add(self.file_read_chunk)
        self.vbox.add(self.menu)

        self.sw = Gtk.ScrolledWindow()
        self.sw.add(self.view)

        self.vbox.pack_start(self.sw, True, True, 0)
        self.add(self.vbox)
        self.view.load_uri(URI)


    def on_change_uri(self, widget):
        new_uri = self.entry_chunk_size.get_text()
        self.view.load_uri(new_uri)


def on_init_web_ext(self):
    print("{py_webkit2_webextension_minimal_gui] on_init_web_ext")
    context.set_web_extensions_directory(".")

if __name__ == "__main__":

    # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # The initialization of the web-extensions must be done as soon as possible.
    # When this program will run, it will scan the local directory '.' for .so files.
    # Then it will search for the entry point (webkit_web_extension_initialize),
    # if it exists, the program will attempt to run it.
    # => check "webkit2_webextension_minimal_so.vala"
    #
    context = WebKit2.WebContext().get_default()
    context.connect("initialize-web-extensions", on_init_web_ext)

    win = Webkit2_win()
    win.set_default_size(900, 700)
    win.connect("delete-event", Gtk.main_quit)
    win.show_all()
    Gtk.main()