$NetBSD$

--- source/Plugins/SymbolFile/DWARF/SymbolFileDWARF.cpp.orig	2016-12-14 14:10:24.000000000 +0000
+++ source/Plugins/SymbolFile/DWARF/SymbolFileDWARF.cpp
@@ -11,6 +11,7 @@
 
 // Other libraries and framework includes
 #include "llvm/Support/Casting.h"
+#include "llvm/Support/Threading.h"
 
 #include "lldb/Core/ArchSpec.h"
 #include "lldb/Core/Module.h"
@@ -553,8 +554,8 @@ uint32_t SymbolFileDWARF::CalculateAbili
 const DWARFDataExtractor &
 SymbolFileDWARF::GetCachedSectionData(lldb::SectionType sect_type,
                                       DWARFDataSegment &data_segment) {
-  std::call_once(data_segment.m_flag, &SymbolFileDWARF::LoadSectionData, this,
-                 sect_type, std::ref(data_segment.m_data));
+  LLVM_DEFINE_ONCE_FLAG(m_flag);
+  llvm::call_once(m_flag,  [this, sect_type, &data_segment]{ this->LoadSectionData(sect_type, std::ref(data_segment.m_data));});
   return data_segment.m_data;
 }
 