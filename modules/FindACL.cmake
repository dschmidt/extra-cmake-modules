# - Try to find the ACL library
# Once done this will define
#
#  ACL_FOUND - system has the ACL library
#  ACL_LIBS - The libraries needed to use ACL

check_include_files(attr/libattr.h HAVE_ATTR_LIBATTR_H)
check_include_files(sys/xattr.h HAVE_SYS_XATTR_H)
check_include_files(sys/acl.h HAVE_SYS_ACL_H)
check_include_files(acl/libacl.h HAVE_ACL_LIBACL_H)

if(HAVE_ATTR_LIBATTR_H AND HAVE_SYS_XATTR_H AND HAVE_SYS_ACL_H AND HAVE_ACL_LIBACL_H)
   set(ACL_HEADERS_FOUND TRUE)
endif(HAVE_ATTR_LIBATTR_H AND HAVE_SYS_XATTR_H AND HAVE_SYS_ACL_H AND HAVE_ACL_LIBACL_H)

if(ACL_HEADERS_FOUND)
   FIND_LIBRARY(ACL_LIBS NAMES acl
      PATHS
      /usr/lib
      /usr/local/lib
   )

   FIND_LIBRARY(ATTR_LIBS NAMES attr
      PATHS
      /usr/lib
      /usr/local/lib
   )	   
endif(ACL_HEADERS_FOUND)

if(ACL_HEADERS_FOUND AND ACL_LIBS AND ATTR_LIBS)
   set(ACL_FOUND TRUE)
   set(ACL_LIBS ${ACL_LIBS} ${ATTR_LIBS})
   message(STATUS "Found ACL support: ${ACL_LIBS}")
endif(ACL_HEADERS_FOUND AND ACL_LIBS AND ATTR_LIBS)

MARK_AS_ADVANCED(ACL_LIBS)

