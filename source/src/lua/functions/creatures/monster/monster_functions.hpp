/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CREATURES_MONSTER_MONSTER_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CREATURES_MONSTER_MONSTER_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"
#include "lua/functions/creatures/monster/charm_functions.hpp"
#include "lua/functions/creatures/monster/loot_functions.hpp"
#include "lua/functions/creatures/monster/monster_spell_functions.hpp"
#include "lua/functions/creatures/monster/monster_type_functions.hpp"

class MonsterFunctions final : LuaScriptInterface {
	private:
		static void init(lua_State* L) {
			registerClass(L, "Monster", "Creature", MonsterFunctions::luaMonsterCreate);
			registerMetaMethod(L, "Monster", "__eq", MonsterFunctions::luaUserdataCompare);
			registerMethod(L, "Monster", "isMonster", MonsterFunctions::luaMonsterIsMonster);
			registerMethod(L, "Monster", "getType", MonsterFunctions::luaMonsterGetType);
			registerMethod(L, "Monster", "setType", MonsterFunctions::luaMonsterSetType);
			registerMethod(L, "Monster", "getSpawnPosition", MonsterFunctions::luaMonsterGetSpawnPosition);
			registerMethod(L, "Monster", "isInSpawnRange", MonsterFunctions::luaMonsterIsInSpawnRange);
			registerMethod(L, "Monster", "isIdle", MonsterFunctions::luaMonsterIsIdle);
			registerMethod(L, "Monster", "setIdle", MonsterFunctions::luaMonsterSetIdle);
			registerMethod(L, "Monster", "isTarget", MonsterFunctions::luaMonsterIsTarget);
			registerMethod(L, "Monster", "isOpponent", MonsterFunctions::luaMonsterIsOpponent);
			registerMethod(L, "Monster", "isFriend", MonsterFunctions::luaMonsterIsFriend);
			registerMethod(L, "Monster", "addFriend", MonsterFunctions::luaMonsterAddFriend);
			registerMethod(L, "Monster", "removeFriend", MonsterFunctions::luaMonsterRemoveFriend);
			registerMethod(L, "Monster", "getFriendList", MonsterFunctions::luaMonsterGetFriendList);
			registerMethod(L, "Monster", "getFriendCount", MonsterFunctions::luaMonsterGetFriendCount);
			registerMethod(L, "Monster", "addTarget", MonsterFunctions::luaMonsterAddTarget);
			registerMethod(L, "Monster", "removeTarget", MonsterFunctions::luaMonsterRemoveTarget);
			registerMethod(L, "Monster", "getTargetList", MonsterFunctions::luaMonsterGetTargetList);
			registerMethod(L, "Monster", "getTargetCount", MonsterFunctions::luaMonsterGetTargetCount);
			registerMethod(L, "Monster", "changeTargetDistance", MonsterFunctions::luaMonsterChangeTargetDistance);
			registerMethod(L, "Monster", "selectTarget", MonsterFunctions::luaMonsterSelectTarget);
			registerMethod(L, "Monster", "searchTarget", MonsterFunctions::luaMonsterSearchTarget);
			registerMethod(L, "Monster", "setSpawnPosition", MonsterFunctions::luaMonsterSetSpawnPosition);
			registerMethod(L, "Monster", "getRespawnType", MonsterFunctions::luaMonsterGetRespawnType);
			registerMethod(L, "Monster", "isMonsterOnHazardSystem", MonsterFunctions::luaPlayerIsMonsterOnHazardSystem);

			registerMethod(L, "Monster", "getTimeToChangeFiendish", MonsterFunctions::luaMonsterGetTimeToChangeFiendish);
			registerMethod(L, "Monster", "setTimeToChangeFiendish", MonsterFunctions::luaMonsterSetTimeToChangeFiendish);
			registerMethod(L, "Monster", "getMonsterForgeClassification", MonsterFunctions::luaMonsterGetMonsterForgeClassification);
			registerMethod(L, "Monster", "setMonsterForgeClassification", MonsterFunctions::luaMonsterSetMonsterForgeClassification);
			registerMethod(L, "Monster", "getForgeStack", MonsterFunctions::luaMonsterGetForgeStack);
			registerMethod(L, "Monster", "setForgeStack", MonsterFunctions::luaMonsterSetForgeStack);
			registerMethod(L, "Monster", "configureForgeSystem", MonsterFunctions::luaMonsterConfigureForgeSystem);
			registerMethod(L, "Monster", "clearFiendishStatus", MonsterFunctions::luaMonsterClearFiendishStatus);
			registerMethod(L, "Monster", "isForgeable", MonsterFunctions::luaMonsterIsForgeable);

			CharmFunctions::init(L);
			LootFunctions::init(L);
			MonsterSpellFunctions::init(L);
			MonsterTypeFunctions::init(L);
		}

		static int luaMonsterCreate(lua_State* L);

		static int luaMonsterIsMonster(lua_State* L);

		static int luaMonsterGetType(lua_State* L);
		static int luaMonsterSetType(lua_State* L);

		static int luaMonsterGetSpawnPosition(lua_State* L);
		static int luaMonsterIsInSpawnRange(lua_State* L);

		static int luaMonsterIsIdle(lua_State* L);
		static int luaMonsterSetIdle(lua_State* L);

		static int luaMonsterIsTarget(lua_State* L);
		static int luaMonsterIsOpponent(lua_State* L);
		static int luaMonsterIsFriend(lua_State* L);

		static int luaMonsterAddFriend(lua_State* L);
		static int luaMonsterRemoveFriend(lua_State* L);
		static int luaMonsterGetFriendList(lua_State* L);
		static int luaMonsterGetFriendCount(lua_State* L);

		static int luaMonsterAddTarget(lua_State* L);
		static int luaMonsterRemoveTarget(lua_State* L);
		static int luaMonsterGetTargetList(lua_State* L);
		static int luaMonsterGetTargetCount(lua_State* L);

		static int luaMonsterChangeTargetDistance(lua_State* L);

		static int luaMonsterSelectTarget(lua_State* L);
		static int luaMonsterSearchTarget(lua_State* L);

		static int luaMonsterSetSpawnPosition(lua_State* L);
		static int luaMonsterGetRespawnType(lua_State* L);
		static int luaPlayerIsMonsterOnHazardSystem(lua_State* L);

		static int luaMonsterGetTimeToChangeFiendish(lua_State* L);
		static int luaMonsterSetTimeToChangeFiendish(lua_State* L);
		static int luaMonsterGetMonsterForgeClassification(lua_State* L);
		static int luaMonsterSetMonsterForgeClassification(lua_State* L);
		static int luaMonsterGetForgeStack(lua_State* L);
		static int luaMonsterSetForgeStack(lua_State* L);
		static int luaMonsterConfigureForgeSystem(lua_State* L);
		static int luaMonsterClearFiendishStatus(lua_State* L);
		static int luaMonsterIsForgeable(lua_State* L);

		friend class CreatureFunctions;
};

#endif // SRC_LUA_FUNCTIONS_CREATURES_MONSTER_MONSTER_FUNCTIONS_HPP_
