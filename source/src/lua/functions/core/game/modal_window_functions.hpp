/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CORE_GAME_MODAL_WINDOW_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CORE_GAME_MODAL_WINDOW_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class ModalWindowFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerClass(L, "ModalWindow", "", ModalWindowFunctions::luaModalWindowCreate);
			registerMetaMethod(L, "ModalWindow", "__eq", ModalWindowFunctions::luaUserdataCompare);
			registerMetaMethod(L, "ModalWindow", "__gc", ModalWindowFunctions::luaModalWindowDelete);
			registerMethod(L, "ModalWindow", "delete", ModalWindowFunctions::luaModalWindowDelete);

			registerMethod(L, "ModalWindow", "getId", ModalWindowFunctions::luaModalWindowGetId);
			registerMethod(L, "ModalWindow", "getTitle", ModalWindowFunctions::luaModalWindowGetTitle);
			registerMethod(L, "ModalWindow", "getMessage", ModalWindowFunctions::luaModalWindowGetMessage);

			registerMethod(L, "ModalWindow", "setTitle", ModalWindowFunctions::luaModalWindowSetTitle);
			registerMethod(L, "ModalWindow", "setMessage", ModalWindowFunctions::luaModalWindowSetMessage);

			registerMethod(L, "ModalWindow", "getButtonCount", ModalWindowFunctions::luaModalWindowGetButtonCount);
			registerMethod(L, "ModalWindow", "getChoiceCount", ModalWindowFunctions::luaModalWindowGetChoiceCount);

			registerMethod(L, "ModalWindow", "addButton", ModalWindowFunctions::luaModalWindowAddButton);
			registerMethod(L, "ModalWindow", "addChoice", ModalWindowFunctions::luaModalWindowAddChoice);

			registerMethod(L, "ModalWindow", "getDefaultEnterButton", ModalWindowFunctions::luaModalWindowGetDefaultEnterButton);
			registerMethod(L, "ModalWindow", "setDefaultEnterButton", ModalWindowFunctions::luaModalWindowSetDefaultEnterButton);

			registerMethod(L, "ModalWindow", "getDefaultEscapeButton", ModalWindowFunctions::luaModalWindowGetDefaultEscapeButton);
			registerMethod(L, "ModalWindow", "setDefaultEscapeButton", ModalWindowFunctions::luaModalWindowSetDefaultEscapeButton);

			registerMethod(L, "ModalWindow", "hasPriority", ModalWindowFunctions::luaModalWindowHasPriority);
			registerMethod(L, "ModalWindow", "setPriority", ModalWindowFunctions::luaModalWindowSetPriority);

			registerMethod(L, "ModalWindow", "sendToPlayer", ModalWindowFunctions::luaModalWindowSendToPlayer);
		}

	private:
		static int luaModalWindowCreate(lua_State* L);
		static int luaModalWindowDelete(lua_State* L);

		static int luaModalWindowGetId(lua_State* L);
		static int luaModalWindowGetTitle(lua_State* L);
		static int luaModalWindowGetMessage(lua_State* L);

		static int luaModalWindowSetTitle(lua_State* L);
		static int luaModalWindowSetMessage(lua_State* L);

		static int luaModalWindowGetButtonCount(lua_State* L);
		static int luaModalWindowGetChoiceCount(lua_State* L);

		static int luaModalWindowAddButton(lua_State* L);
		static int luaModalWindowAddChoice(lua_State* L);

		static int luaModalWindowGetDefaultEnterButton(lua_State* L);
		static int luaModalWindowSetDefaultEnterButton(lua_State* L);

		static int luaModalWindowGetDefaultEscapeButton(lua_State* L);
		static int luaModalWindowSetDefaultEscapeButton(lua_State* L);

		static int luaModalWindowHasPriority(lua_State* L);
		static int luaModalWindowSetPriority(lua_State* L);

		static int luaModalWindowSendToPlayer(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_CORE_GAME_MODAL_WINDOW_FUNCTIONS_HPP_
