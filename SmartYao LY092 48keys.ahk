;#InstallKeybdHook

;; !!! this does not work .. I have TWO of these to map !!!

; Koolertron SMKD72 / SmartYao LY092-SN matrix keyboard

; each key assigned HID = to its key position (11,12,13..18; 21,22,23..28 ..)
LY092_HIDMap48:= [
    ['h', 'i', 'j', 'k', 'l', 'm', 'n', 'o'],
    ['r', 's', 't', 'u', 'v', 'w', 'x', 'y'],
    ['2', '3', '4', '5', '6', '7', '8', '9'],
    ['Escape', 'Backspace', 'Tab', 'Space', '-', '=', '[', ']' ],
    ['`;', "'", '``', ',', '.', '/', 'CapsLock', 'F1'],
    ['F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10', 'F11']
]

; reference keys map, chosen by hand (avoid CapsLock of LY092_HIDMap48 etc)
LY092_RefMap48 := [
    ['F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8'],
    ['1', '2', '3', '4', '5', '6', '7', '8'],
    ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'],
    ['i', 'j', 'k', 'l', 'm', 'n', 'o', 'p'],
    ['q', 'r', 's', 't', 'u', 'v', 'w', 'x'],
    [',', '.', '/', '`;', "'", '[', ']', '\']
]


srcRowsToArray(srcRows)
{
    srcKeys := []
    for idxrow, srcRow_ in srcRows 
    {
        srcKeys[idxRow] := []
        srcRow := StrSplit(srcRow_, A_Space)
        for idxKey, srcKey in srcRow 
        {
            srcKeys[idxRow][idxKey] := srcKey
        }
    }

    return srcKeys
}


showSrcKeys(srcKeys)
{
    Loop 6
    {
        idxRow := A_Index
        Loop 8
        {
            idxKey := A_Index
            srcKey := srcKeys[idxRow][idxKey]
            sc := Format('sc{:03x}', GetKeySC(srcKey))
            
            outputdebug idxRow idxKey " " srcKey " " sc
        }
        outputdebug " "
    }
}


; showSrcKeys(LY092_RefMap48)
; outputdebug " ----  "
; showSrcKeys(LY092_HIDMap48)
