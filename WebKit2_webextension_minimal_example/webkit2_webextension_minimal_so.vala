// valac --pkg webkit2gtk-web-extension-3.0 --pkg javascriptcoregtk-3.0 --Xcc="-I/usr/include/webkitgtk-3.0" --Xcc "-I/usr/include/libsoup-2.4"  --library=webkit_webextension_02  -X -fPIC -X -shared -o webkit2_webextension_minimal.so webkit2_webextension_minimal_so.vala

// Types: WebKit.WebPage web_page, WebKit.URIRequest request, WebKit.URIResponse? redirected_response


/** 
 * Entry point function.
 * when WebKit scans the directories for shared libraries (.so), it looks for this function.
 * If it's absent the .so file is ignored. 
*/
public static void webkit_web_extension_initialize (WebKit.WebExtension web_extension) {
    string PROG = "[webkit2_webextension_minimal_so.so] ";    
    
    print(PROG + "PLUGIN activated\n");
    
    // First signal: a new web page is queried.
    web_extension.page_created.connect((extension, web_page)=> {
        print(PROG + "SIGNAL: page_created\n");
        
        // 2d signal: the request(s).
        // For each resource (CSS, javascript, images, etc) queried by the new page, this signal will be emitted.
        // This enables us, for example, to allow/block resources. (A typical use would be an adblocker.)
        web_page.send_request.connect((request)=> {
            
            // Forbid google.com & data URIs (images usually)
            if(request.uri.has_prefix("http://www.google") || request.uri.has_prefix("data")){
                print(PROG + "SIGNAL: send request [REJECTED] " + request.uri + "\n");
                return true;  // true => block query
            }
            print(PROG + "SIGNAL: send request " + request.uri + "\n");
            return false;
        });
        
        return;
    });
    
}
