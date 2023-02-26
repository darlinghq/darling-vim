
SDKROOT=$(cd ../../../../../Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk)
DYNAMIC_RUBY_VER=$(readlink ${SDKROOT}/System/Library/Frameworks/Ruby.framework/Versions/Current | sed 's:\.::')
DERIVED_FILE_DIR="$(cd ../.. && pwd)/gen"

mkdir -p $DERIVED_FILE_DIR

echo "#define DYNAMIC_RUBY_VER ${DYNAMIC_RUBY_VER}" > ${DERIVED_FILE_DIR}/vim_dynamic_config.h
echo "#define RUBY_VERSION ${DYNAMIC_RUBY_VER}" >> ${DERIVED_FILE_DIR}/vim_dynamic_config.h
