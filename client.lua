local hasHandsUp = false

RegisterCommand('handsup', function()
  local playerPed = PlayerPedId()

  if hasHandsUp then
    ClearPedTasks(playerPed)
    hasHandsUp = false
  else
    if 
      not IsPedSwimming(playerPed) 
      and not IsPedShooting(playerPed)
      and not IsPedClimbing(playerPed) 
      and not IsPedCuffed(playerPed) 
      and not IsPedDiving(playerPed) 
      and not IsPedFalling(playerPed) 
      and not IsPedJumping(playerPed) 
      and not IsPedJumpingOutOfVehicle(playerPed) 
      and IsPedOnFoot(playerPed) 
      and not IsPedRunning(playerPed) 
      and not IsPedUsingAnyScenario(playerPed) 
      and not IsPedInParachuteFreeFall(playerPed) 
      and not IsEntityDead(playerPed)
    then
      SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)

      local dict = "random@mugging3"
      RequestAnimDict(dict)
      
      while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
      end

      TaskPlayAnim(playerPed, dict, "handsup_standing_base", 8.0, 8.0, -1, 50, 0, false, false, false)

      RemoveAnimDict(dict)

      hasHandsUp = true
    end
  end
end)

RegisterKeyMapping('handsup', '(Player) Put Your Hands Up', 'keyboard', 'G')

local hasHandsOnHead = false

RegisterCommand('handsonhead', function()
  local playerPed = PlayerPedId()

  if hasHandsOnHead then
    ClearPedTasks(playerPed)
    hasHandsOnHead = false
  else
    if 
      not IsPedSwimming(playerPed) 
      and not IsPedShooting(playerPed)
      and not IsPedClimbing(playerPed) 
      and not IsPedCuffed(playerPed) 
      and not IsPedDiving(playerPed) 
      and not IsPedFalling(playerPed) 
      and not IsPedJumping(playerPed) 
      and not IsPedJumpingOutOfVehicle(playerPed) 
      and IsPedOnFoot(playerPed) 
      and not IsPedRunning(playerPed) 
      and not IsPedUsingAnyScenario(playerPed) 
      and not IsPedInParachuteFreeFall(playerPed) 
      and not IsEntityDead(playerPed)
    then
      SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)

      local dict = "random@arrests@busted"
      RequestAnimDict(dict)
      
      while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
      end

      TaskPlayAnim(playerPed, dict, "idle_c", 8.0, 8.0, -1, 50, 0, false, false, false)

      RemoveAnimDict(dict)

      hasHandsOnHead = true
    end
  end
end)

RegisterKeyMapping('handsonhead', '(Player) Put Hands On Head', 'keyboard', 'K')

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if hasHandsUp or hasHandsOnHead then
			DisableControlAction(0, 24, true) -- attack
			DisableControlAction(0, 25, true) -- aim
			DisableControlAction(0, 37, true) -- weapon wheel
			DisableControlAction(0, 44, true) -- cover
			DisableControlAction(0, 45, true) -- reload
			DisableControlAction(0, 140, true) -- light attack
			DisableControlAction(0, 141, true) -- heavy attack
			DisableControlAction(0, 142, true) -- alternative attack
			DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
		end	
	end
end)
	