/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_UTILS_DEFINITIONS_H_
#define SRC_UTILS_DEFINITIONS_H_

#ifndef __FUNCTION__
	#define __FUNCTION__ __func__
#endif

#ifndef _CRT_SECURE_NO_WARNINGS
	#define _CRT_SECURE_NO_WARNINGS
#endif

#ifndef _USE_MATH_DEFINES
	#define _USE_MATH_DEFINES
#endif

#ifdef _WIN32
	#ifndef NOMINMAX
		#define NOMINMAX
	#endif

	#if defined(_WIN32) || defined(WIN32) || defined(__CYGWIN__) || defined(__MINGW32__) || defined(__BORLANDC__)
		#define OS_WINDOWS
	#endif

	#define WIN32_LEAN_AND_MEAN

	#ifdef _MSC_VER
		#ifdef NDEBUG
			#define _SECURE_SCL 0
			#define HAS_ITERATOR_DEBUGGING 0
		#endif

		#pragma warning(disable : 4127) // conditional expression is constant
		#pragma warning(disable : 4244) // 'argument' : conversion from 'type1' to 'type2', possible loss of data
		#pragma warning(disable : 4250) // 'class1' : inherits 'class2::member' via dominance
		#pragma warning(disable : 4267) // 'var' : conversion from 'size_t' to 'type', possible loss of data
		#pragma warning(disable : 4319) // '~': zero extending 'unsigned int' to 'lua_Number' of greater size
		#pragma warning(disable : 4458) // declaration hides class member
		#pragma warning(disable : 4101) // local variable not referenced
		#pragma warning(disable : 4996) // declaration std::fpos<_Mbstatet>::seekpos
	#endif

	#define strcasecmp _stricmp
	#define strncasecmp _strnicmp

	#ifndef _WIN32_WINNT
		// 0x0602: Windows 7
		#define _WIN32_WINNT 0x0602
	#endif
#endif

#ifndef M_PI
	#define M_PI 3.14159265358979323846
#endif

typedef int error_t;

#endif // SRC_UTILS_DEFINITIONS_H_
