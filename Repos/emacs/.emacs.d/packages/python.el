(req-package company-jedi
  :require company python-mode
  :config (progn
            (add-hook 'python-mode-hook
                      '(lambda ()
                         (add-to-list 'company-backends 'company-jedi)))))

(req-package python-mode)
    
