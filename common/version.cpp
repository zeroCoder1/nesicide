static char __nesicide_version__ [] = "V1.040"
#if defined ( QT_NO_DEBUG )
" RELEASE";
#else
" DEBUG";
#endif

char* nesicideGetVersion()
{
   return __nesicide_version__;
}
