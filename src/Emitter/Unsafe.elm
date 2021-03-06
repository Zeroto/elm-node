module Emitter.Unsafe (on0, on1, on2, listenerCount, removeAllListeners, removeAllListeners', setMaxListeners, emit1, emit2, emit3, EventName) where

import Foreign.Pattern.Listen exposing (listen1, listen1_1, listen1_2)
import Foreign.Pattern.Method exposing (..)
import Foreign.Pattern.Get exposing (get1)
import Task exposing (Task)


type alias EventName =
    String


on_ : (String -> String -> emitter -> EventName -> handler -> Task x (Task x ())) -> EventName -> emitter -> handler -> Task x (Task x ())
on_ listenHelper event emitter handler =
    listenHelper "addListener" "removeListener" emitter event handler


on0 : EventName -> emitter -> Task x () -> Task x (Task x ())
on0 =
    on_ listen1


on1 : EventName -> emitter -> (a -> Task x ()) -> Task x (Task x ())
on1 =
    on_ listen1_1


on2 : EventName -> emitter -> (( a, b ) -> Task x ()) -> Task x (Task x ())
on2 =
    on_ listen1_2


listenerCount : EventName -> emitter -> Task x Int
listenerCount event emitter =
    get1 "listenerCount" emitter event


removeAllListeners : EventName -> emitter -> Task x ()
removeAllListeners event emitter =
    method1 "removeAllListeners" emitter event


removeAllListeners' : emitter -> Task x ()
removeAllListeners' =
    method0 "removeAllListeners"


setMaxListeners : Int -> emitter -> Task x ()
setMaxListeners max emitter =
    method1 "setMaxListeners" emitter max


emit_ : (String -> emitter -> EventName -> arityToTask) -> EventName -> emitter -> arityToTask
emit_ methodHelper event emitter =
    methodHelper "emit" emitter event


emit1 : EventName -> emitter -> a -> Task x ()
emit1 =
    emit_ method2


emit2 : EventName -> emitter -> a -> b -> Task x ()
emit2 =
    emit_ method3


emit3 : EventName -> emitter -> a -> b -> c -> Task x ()
emit3 =
    emit_ method4
