inoremap <lt>/ </<C-x><C-o>


syn region  htmlTag start=+<[^/]+   end=+>+ fold contains=htmlTagN,angularArg,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
syn keyword angularArg contained "\<\(ng-app\|ng-controller\|ng-model\)\>"
