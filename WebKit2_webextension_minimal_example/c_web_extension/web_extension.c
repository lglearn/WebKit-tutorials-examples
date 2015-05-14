/**
  * Minimal example of WebKit2 Web Extension, using C.
  *
  * [Using Linux, start a shell]
  * Compile this code using the Makefile (type the command 'make'),
  * ignore the warnings about unused parameters, they are normal.
  *
  * This will generate "bin/Release/webkit2_web_extension.so".
  * Copy this file in one of the GUI examples directories and start the GUI
  * example from the console: if the web-extension works,
  * you should see messages in the console.
  *
  * The make file is generated using "cbp2make.linux-x86_64" on a Code::Blocks project file.
  */
#include <stdlib.h>
#include <string.h>
#include <webkit2/webkit-web-extension.h>

#define PROG "[web_extension.so]"

// --------------------------------------------------------------------------------------------
/** 2d signal: the request(s).
  * For each resource (CSS, javascript, images, etc) queried by the new page, this signal will be emitted.
  * This enables us, for example, to allow/block resources. (A typical use would be an adblocker.)
  */
static int
web_page_send_request_cb (WebKitWebPage      *web_page,
                          WebKitURIRequest *request,
                          gpointer          user_data){

    const gchar *req = NULL;
    req = webkit_uri_request_get_uri(request);

    const gchar *BLOCK_GOOGLE = "http://www.google";
    const gchar *BLOCK_DATA = "data";

    // Forbid google.com & data URIs (images usually)
    if (strncmp (req, BLOCK_GOOGLE, strlen(BLOCK_GOOGLE)) == 0
        || strncmp (req, BLOCK_DATA, strlen(BLOCK_DATA)) == 0){
        g_print (PROG " SIGNAL: send request [REJECTED] %s\n", req);
        return TRUE;
    }

    g_print (PROG " SIGNAL: send request %s\n", req);
    return FALSE;
}

// --------------------------------------------------------------------------------------------
/**
  * First signal: a new web page is queried.
  */
static void
web_page_created_cb (WebKitWebExtension *extension,
                     WebKitWebPage      *web_page,
                     gpointer            user_data){
    //g_print ("Page  %d created for %s\n",
    //         webkit_web_page_get_id (web_page),
    //         webkit_web_page_get_uri (web_page)); => doesn't work. Why?

    g_print (PROG " SIGNAL: Page created\n");
    g_signal_connect (web_page, "send-request",
                      G_CALLBACK (web_page_send_request_cb),
                      NULL);

}

// ======================================================================================================
/**
 * Entry point function.
 * when WebKit scans the directories for shared libraries (.so), it looks for this function.
 * If it's absent the .so file is ignored.
*/
G_MODULE_EXPORT void
webkit_web_extension_initialize (WebKitWebExtension *extension){

    g_print(PROG " PLUGIN activated\n");

    g_signal_connect (extension, "page-created",
                      G_CALLBACK (web_page_created_cb),
                      NULL);
}
