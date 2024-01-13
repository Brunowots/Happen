/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_ITEMS_ITEM_CLASSIFICATION_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_ITEMS_ITEM_CLASSIFICATION_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class ItemClassificationFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerClass(L, "ItemClassification", "", ItemClassificationFunctions::luaItemClassificationCreate);
			registerMetaMethod(L, "ItemClassification", "__eq", ItemClassificationFunctions::luaUserdataCompare);

			registerMethod(L, "ItemClassification", "addTier", ItemClassificationFunctions::luaItemClassificationAddTier);
		}

	private:
		static int luaItemClassificationCreate(lua_State* L);
		static int luaItemClassificationAddTier(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_ITEMS_ITEM_CLASSIFICATION_FUNCTIONS_HPP_
