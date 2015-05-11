// valac --pkg gtk+-3.0 --pkg webkit2gtk-3.0   webkit2_minimal.vala

// If the compilation does not work, check the VAPI files.
// For instance in: /usr/share/vala-0.??/vapi/ => webkit2gtk-3.0.vapi & webkit2gtk-3.0.deps must be present.

using Gtk;
using WebKit;

/**
 *  Minimal example of WebKit2 (GTK3 version) usage.
 */
public class ValaWebKitBrowser : Window {

    private const string TITLE = "Vala WebKit Browser";
    private const string DEFAULT_URL = "http://acid3.acidtests.org/";

    private Gtk.Entry url_entry;
    private WebKit.WebView web_view;
    private Gtk.Button go_button;

	//----------------------------------------------------------------
    public ValaWebKitBrowser () {
        this.title = TITLE;
        set_default_size (800, 600);

        this.url_entry = new Gtk.Entry ();
        this.url_entry.set_text(DEFAULT_URL);
        
        this.web_view = new WebKit.WebView (); // => WebKit
            
        var scrolled_window = new Gtk.ScrolledWindow (null, null);
        scrolled_window.set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
        scrolled_window.add (this.web_view);
        
        this.go_button = new Gtk.Button.with_label ("  Go  ");
        this.go_button.clicked.connect (() => {
			this.web_view.load_uri (this.url_entry.text);
		});
        
        var hbox = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        hbox.pack_start (this.url_entry, true, true, 0);
        hbox.pack_start (this.go_button, false, true, 0);
         
        var vbox = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        vbox.pack_start (hbox, false, true, 0);
        vbox.pack_start (scrolled_window, true, true, 0);
        add (vbox);
        
        this.destroy.connect (Gtk.main_quit);

        this.url_entry.grab_focus ();
    }
    
	//----------------------------------------------------------------
    public void start () {
        show_all ();
        this.web_view.load_uri (DEFAULT_URL);
    }

	// =========================================================================
    public static int main (string[] args) {
        Gtk.init (ref args);
        
        var browser = new ValaWebKitBrowser ();
        browser.start ();

        Gtk.main ();

        return 0;
    }
}
