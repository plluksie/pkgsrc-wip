$NetBSD$

--- source/Plugins/Process/gdb-remote/ProcessGDBRemote.cpp.orig	2017-02-02 23:56:41.000000000 +0000
+++ source/Plugins/Process/gdb-remote/ProcessGDBRemote.cpp
@@ -81,6 +81,7 @@
 
 #include "llvm/ADT/StringSwitch.h"
 #include "llvm/Support/raw_ostream.h"
+#include "llvm/Support/Threading.h"
 
 #define DEBUGSERVER_BASENAME "debugserver"
 using namespace lldb;
@@ -3434,9 +3435,9 @@ void ProcessGDBRemote::KillDebugserverPr
 }
 
 void ProcessGDBRemote::Initialize() {
-  static std::once_flag g_once_flag;
+  LLVM_DEFINE_ONCE_FLAG(g_once_flag);
 
-  std::call_once(g_once_flag, []() {
+  llvm::call_once(g_once_flag, []() {
     PluginManager::RegisterPlugin(GetPluginNameStatic(),
                                   GetPluginDescriptionStatic(), CreateInstance,
                                   DebuggerInitialize);