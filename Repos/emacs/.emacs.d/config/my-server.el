(provide 'my-server)

;; start the server unless we're already going
(require 'server)
(unless (server-running-p)
  (server-start))
