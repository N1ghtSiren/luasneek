_ru = "Русский"
_eng = "English"

function setLanguage(langcode,refreshButtons)
    if(langcode=="en")then
        locale_conf_tip_1 = "config loaded succecefully"
        locale_conf_tip_2 = "config cant be loaded, seems broken:"
        locale_conf_tip_3 = "config cannot be found, creating default one"
        locale_conf_tip_4 = "F1 - reload config (means you can fix it by hands)"
        locale_conf_tip_5 = "F2 - backup this config and create default one"
        locale_conf_tip_6 = "F4 - create default one without backup"
        locale_conf_tip_7 = "If you will delete config by yourself, new default one will be created"
        locale_conf_tip_8 = "Backups placed as gamefolder\\backups\\config[date].lua"
        locale_conf_tip_9 = "Press Enter or Space"
        locale_conf_tip_10 = "missing variable in config: "
        --
        locale_sneek = "SNEEK     play when"
        locale_startGame = "Start game"
        locale_leaderBoard = "Leaderboard(soontm)"
        locale_controls = "Controls"
        locale_visuals = "Visual settings"
        locale_moresettings = "More settings"
        locale_languages = "Change language"
        locale_exit = "Exit"
        --
        locale_classic = "Classic"
        locale_custom = "Custom(soontm)"
        locale_challenges = "Scenarios(soontm)"
        --
        locale_up = "up"
        locale_down = "down"
        locale_left = "left"
        locale_right = "right"
        locale_increase = "increase"
        locale_decrease = "decrease"
        locale_back = "back"
        locale_confirm = "confirm"
        locale_saveandback = "Save and back"
        locale_menuback = "Back"
        --
        locale_grid = "Grid"
        locale_snake_body = "Snake Body"
        locale_snake_head = "Snake Head"
        locale_apple = "Apple"
        locale_borders = "Barriers"
        --
        locale_menu_tip_1 = "Back with saving changes to config"
        locale_menu_tip_2 = "Back without saving changes to config"
        locale_menu_tip_3 = "Key"
        locale_menu_tip_4 = "main"
        locale_menu_tip_5 = "alt"
        locale_menu_tip_6 = "Press F1 to discard changes you made"
        locale_menu_tip_7 = "Press F5 to reset to default"
        locale_menu_tip_8 = "kp* hotkeys means numpad"
        locale_menu_tip_9 = "unknown hotkeys mostly appears when made on non-english keyboard language"
        locale_menu_tip_10 = "Press the button"
        --
        locale_menu_tip_11 = "symbol"
        locale_menu_tip_12 = "red"
        locale_menu_tip_13 = "green"
        locale_menu_tip_14 = "blue"
        locale_menu_tip_15 = "alpha"
        locale_menu_tip_16 = "scale"
        locale_menu_tip_17 = "Element"
        locale_menu_tip_18 = "Shows current head direction by replacing head symbol to w/a/s/d"
        locale_menu_tip_19 = "Always overrides current head symbol if turned on(true)"
        locale_menu_tip_20 = "Grid is \"cells\" on background, needs no symbol"
        --
        locale_menu_tip_21 = "Grid scale sets grid size in pixels"
        locale_menu_tip_22 = "Symbol for snake head can be overwrited by DisplayCurrentDirection setting"
        locale_menu_tip_23 = "Send some text"
        locale_menu_tip_24 = "Alpha is transparency; 0 is invisible"
        locale_menu_tip_25 = "and 1 is fully visible"
        locale_menu_tip_26 = "X offset"
        locale_menu_tip_27 = "Y offset"
        locale_menu_tip_28 = "Set x/y offset for symbol if its not centered on grid cell"
        locale_menu_tip_29 = "X=horisontal(right/left), Y=vertical(up/down)"
        locale_menu_tip_30 = "on/off"
        --
        locale_menu_tip_31 = "Setting too big value may make game not fit in your screen"
        locale_menu_tip_32 = "Then first setup grid size and rest in visual settings"
        locale_menu_tip_33 = "Classic game:"
        locale_menu_tip_34 = "Game speed can be chosen and not changes during game"
        locale_menu_tip_35 = "Limit is 1 apple"
        locale_menu_tip_36 = "Field size can be chosen"
        locale_menu_tip_37 = "Game overs on hitting barrier or own body"
        locale_menu_tip_38 = "Game speed formula: [1/speed] seconds for move"
        locale_menu_tip_39 = "Custom game:"
        locale_menu_tip_40 = "Game speed can be chosen and can change during game"
        --
        locale_menu_tip_41 = "Game speed formula can be chosen"
        locale_menu_tip_42 = "Apple limit can be chosen"
        locale_menu_tip_43 = "Field size can be chosen"
        locale_menu_tip_44 = "Scenarios:"
        locale_menu_tip_45 = "Different scenarios of game behaviour"
        locale_menu_tip_46 = "Each has own features!"
        locale_menu_tip_47 = "If symbols becoming blurry, check solution in 'More settings'"
        locale_menu_tip_48 = "Setup base size and font scale if symbols becoming blurry on high scales of symbols"
        --
        locale_game_tip_1 = "next: "
        locale_game_tip_2 = "score: "
        locale_game_tip_3 = "you "
        locale_game_tip_4 = "best: "
        locale_game_tip_5 = "prev: "
        locale_game_tip_6 = "time: "
        locale_game_tip_7 = "speed: "
        locale_game_tip_8 = "pause: "
        locale_game_tip_9 = "PAUSED"
        locale_game_tip_10 = "DEFEATED"
        --
        locale_game_tip_11 = "Score: "
        locale_game_tip_12 = "Game speed: "
        locale_game_tip_13 = "Field size: "
        locale_game_tip_14 = "Game time: "
        locale_game_tip_15 = " frames"
        locale_game_tip_16 = "To menu: "
        locale_game_tip_17 = "Try again: "
        locale_game_tip_18 = "YOU WON"
        --
        locale_settings_head = "Snake moves"
        locale_settings_font_size = "Font Size"
        locale_settings_font_scale = "Font Scale"
        --
        locale_menu_game_speed = "Game speed"
        locale_menu_grid_size = "Grid size"
        locale_menu_start_game = "Start Game"
    elseif(langcode=="ru")then
        locale_conf_tip_1 = "настройки успешно загружены"
        locale_conf_tip_2 = "конфиг не загружен, походу шото сломалось:"
        locale_conf_tip_3 = "настройки не найдены, создаю стандартные"
        locale_conf_tip_4 = "жми F1 - перезагрузить конфиг(если ты пытаешься его починить)"
        locale_conf_tip_5 = "жми F2 - забекапить этот конфиг и создать стандартный"
        locale_conf_tip_6 = "жми F4 - создать стандартный, не сохраняя старый"
        locale_conf_tip_7 = "если конфиг удалить, стандартный будет создан (после ф1)"
        locale_conf_tip_8 = "бекапы сохраняются как ПАПКА С ИГРОЙ\\backups\\config[дата].lua"
        locale_conf_tip_9 = "жми Ентер или Пробел!"
        locale_conf_tip_10 = "в конфиге отсутствует переменная: "
        --
        locale_sneek = "ЗМЕЙКА     слыш поиграй!"
        locale_startGame = "Начать игру"
        locale_leaderBoard = "Таблица лидеров(soontm)"
        locale_controls = "Управление"
        locale_visuals = "Настройки отображения"
        locale_moresettings = "Больше настроек"
        locale_languages = "Сменить Язык"
        locale_exit = "Выход"
        --
        locale_classic = "Классика"
        locale_custom = "Своя игра(soontm)"
        locale_challenges = "Сценарии(soontm)"
        --
        locale_up = "вверх"
        locale_down = "вниз"
        locale_left = "влево"
        locale_right = "вправо"
        locale_increase = "прибавить"
        locale_decrease = "отнять"
        locale_back = "назад"
        locale_confirm = "подтвердить"
        locale_saveandback = "Сохранить и назад"
        locale_menuback = "Назад"
        --
        locale_grid = "Сетка"
        locale_snake_body = "Тело змеи"
        locale_snake_head = "Голова змеи"
        locale_apple = "Яблоко"
        locale_borders = "Препятствия"
        --
        locale_menu_tip_1 = "Сохранить настройки и назад"
        locale_menu_tip_2 = "Не сохранять настройки и назад"
        locale_menu_tip_3 = "Клавиша"
        locale_menu_tip_4 = "основная"
        locale_menu_tip_5 = "доп"
        locale_menu_tip_6 = "Жми F1 для отмены изменений"
        locale_menu_tip_7 = "Жми F5 для возврата к стандартным настройкам"
        locale_menu_tip_8 = "Кнопки типа kp* это нумпад"
        locale_menu_tip_9 = "Кнопки unknown появляются когда кнопка нажата в не-английской раскладке"
        locale_menu_tip_10 = "Жми кнопку!"
        --
        locale_menu_tip_11 = "символ"
        locale_menu_tip_12 = "красный"
        locale_menu_tip_13 = "зелёный"
        locale_menu_tip_14 = "синий"
        locale_menu_tip_15 = "альфа"
        locale_menu_tip_16 = "размер"
        locale_menu_tip_17 = "Элемент"
        locale_menu_tip_18 = "Отображение движения головы змеи засчёт смены символа головы на w/a/s/d"
        locale_menu_tip_19 = "Всегда перезаписывает текущий символ головы если включено(true)"
        locale_menu_tip_20 = "Сетка это клетки на фоне, символ не требуется"
        --
        locale_menu_tip_21 = "Размер сетки выставляется в пикселях"
        locale_menu_tip_22 = "Символ головы змеи может быть перезаписан другой настройкой"
        locale_menu_tip_23 = "Отправь текст!"
        locale_menu_tip_24 = "Альфа это прозрачность; 0 делает полностью прозрачным"
        locale_menu_tip_25 = "и 1 полностью непрозначным"
        locale_menu_tip_26 = "отступ X"
        locale_menu_tip_27 = "отступ Y"
        locale_menu_tip_28 = "Выставь смещение по x/y если конкретный символ не отцентрован на сетке"
        locale_menu_tip_29 = "X=горизонталь(право/лево), Y=вертикаль(верх/низ)"
        locale_menu_tip_30 = "вкл/выкл"
        --
        locale_menu_tip_31 = "Установка слишком большого значения может не вместить игру в размеры экрана"
        locale_menu_tip_32 = "Тогда сначала подгони размер сетки и всё под него в визуальных настройках"
        locale_menu_tip_33 = "Классическая игра:"
        locale_menu_tip_34 = "Скорость игры на выбор и во время игры не изменяется"
        locale_menu_tip_35 = "Максимум 1 яблоко"
        locale_menu_tip_36 = "Размер поля на выбор"
        locale_menu_tip_37 = "Игра заканчивается при ударе о препятствие или своё тело"
        locale_menu_tip_38 = "Формула скорости игры: [1/скорость] сек на ход"
        locale_menu_tip_39 = "Своя игра:"
        locale_menu_tip_40 = "Скорость игры на выбор и во время игры может изменяться"
        --
        locale_menu_tip_41 = "Формула скорости игры на выбор"
        locale_menu_tip_42 = "Лимит яблок на выбор"
        locale_menu_tip_43 = "Размер поля на выбор"
        locale_menu_tip_44 = "Сценарии:"
        locale_menu_tip_45 = "Разные сценарии поведения игры"
        locale_menu_tip_46 = "У каждого свои фишки!"
        locale_menu_tip_47 = "Если символы начинают выглядеть размыто, посмотрите решение в меню 'Больше настроек'"
        locale_menu_tip_48 = "Настройте размер и масштаб шрифта если символы становятся размытыми при больших масштабах"
        --
        locale_game_tip_1 = "лидер: "
        locale_game_tip_2 = "очки: "
        locale_game_tip_3 = "ты "
        locale_game_tip_4 = "лучший: "
        locale_game_tip_5 = "хуже: "
        locale_game_tip_6 = "время: "
        locale_game_tip_7 = "скорость: "
        locale_game_tip_8 = "пауза: "
        locale_game_tip_9 = "ПАУЗА"
        locale_game_tip_10 = "ТЫ ПРОИГРАЛ"
        --
        locale_game_tip_11 = "Очки: "
        locale_game_tip_12 = "Скорость игры: "
        locale_game_tip_13 = "Размер поля: "
        locale_game_tip_14 = "Время игры: "
        locale_game_tip_15 = " ходов"
        locale_game_tip_16 = "В меню: "
        locale_game_tip_17 = "Фаст рмк:? "
        locale_game_tip_18 = "ТЫ ПОБЕДИЛ"
        --
        locale_settings_head = "Движение змеи"
        locale_settings_font_size = "Размер шрифта"
        locale_settings_font_scale = "Масштаб шрифта"
        --
        locale_menu_game_speed = "Скорость игры"
        locale_menu_grid_size = "Размер поля"
        locale_menu_start_game = "Начать игру"

    end
    love.window.setTitle(locale_sneek)
    --
    if(refreshButtons==true)then
        refreshButtonsText(mainMenu)
        refreshButtonsText(startMenu)
        refreshButtonsText(controlsMenu)
        refreshButtonsText(visualMenu)
        refreshButtonsText(settingsMenu)
        refreshButtonsText(classicMenu)
    end
end


--
local lang_pick_menu = newMenu(1)
addButton(lang_pick_menu,1,"_ru")
addButton(lang_pick_menu,1,"_eng")
setSelectedButton(lang_pick_menu,1,1)
currentMenu = lang_pick_menu

local language_picked = false


function waitForLangPick()
    if(currentMenu~=lang_pick_menu)then
        return
    end

    local m = lang_pick_menu
    local c,r = getSelectedButton(m)
--up
    if(isKeyPressed("w","up"))then
        setSelectedButton(m,c,r-1)
--down
    elseif(isKeyPressed("s","down"))then
        setSelectedButton(m,c,r+1)
    end

    c,r = getSelectedButton(m)
    if(r==1)then
        if(isKeyPressed("space","return"))then
            setLanguage("ru")
            language_picked = true
            currentMenu = nil
            waitForUserInput()
        end
    elseif(r==2)then
        if(isKeyPressed("space","return"))then
            setLanguage("en")
            language_picked = true
            currentMenu = nil
            waitForUserInput()
        end
    end

    return language_picked
end
addOnUpdate(waitForLangPick)

local function f1()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf("... ??? !!!",10,0, 999, "left",0)
    return language_picked
end

local flag=false
local function fu()
    flag = drawIf(flag,f1,0,currentMenu==lang_pick_menu)
    return language_picked
end
addOnUpdate(fu)