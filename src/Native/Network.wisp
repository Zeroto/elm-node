(defn- make
  [localRuntime]
  (do
    (foreign.sanitize localRuntime :Native :Network)
    (if localRuntime.Native.Network.values
        localRuntime.Native.Network.values
        (set! localRuntime.Native.Network.values {

  :marshallSocketAddress (F3 (fn [IPv4 IPv6 SocketAddress raw]
    (SocketAddress
      raw.port
      (if (== "IPv6" raw.family)
        IPv4
        IPv6)
      raw.address)))

  } ))))

(foreign.sanitize Elm :Native :Network)
(set! Elm.Native.Network.make make)
