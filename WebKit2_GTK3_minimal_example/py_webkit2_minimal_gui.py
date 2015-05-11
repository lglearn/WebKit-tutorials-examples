#!/usr/bin/python3
import gi
gi.require_version('WebKit', '3.0')
from gi.repository import Gtk, WebKit2

URI = "http://acid3.acidtests.org/"

class Webkit2_win(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="WebKit2 GUI demo")

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


if __name__ == "__main__":
    win = Webkit2_win()
    win.set_default_size(900, 700)
    win.connect("delete-event", Gtk.main_quit)
    win.show_all()
    Gtk.main()
