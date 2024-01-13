/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_PCH_HPP_
#define SRC_PCH_HPP_

// Definitions should be global.
#include "utils/definitions.h"
#include "utils/simd.hpp"

#include <bitset>
#include <charconv>
#include <filesystem>
#include <fstream>
#include <forward_list>
#include <list>
#include <map>
#include <random>
#include <ranges>
#include <regex>
#include <set>
#include <queue>
#include <vector>
#include <variant>

#include <asio.hpp>
#include <absl/numeric/int128.h>
#include <curl/curl.h>
#include <fmt/chrono.h>
#include <gmp.h>
#include <json/json.h>
#if __has_include("luajit/lua.hpp")
	#include <luajit/lua.hpp>
#else
	#include <lua.hpp>
#endif
#include <magic_enum.hpp>
#include <mio/mmap.hpp>
#if __has_include("<mysql.h>")
	#include <mysql.h>
#else
	#include <mysql/mysql.h>
#endif
#include <mysql/errmsg.h>
#include <spdlog/spdlog.h>
#include <parallel_hashmap/phmap.h>
#include <pugixml.hpp>
#include <zlib.h>

#endif // SRC_PCH_HPP_
