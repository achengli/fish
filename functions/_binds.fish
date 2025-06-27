function _binds
  bind -M insert \cf _fzf_search_directory
  bind -M insert \cl _fzf_search_git_log
  bind -M insert \cs _fzf_search_git_status
  bind -M insert \cr _fzf_search_history
  bind -M insert \cp _fzf_search_processes

  bind \cf _fzf_search_directory
  bind \cl _fzf_search_git_log
  bind \cs _fzf_search_git_status
  bind \cr _fzf_search_history
  bind \cp _fzf_search_processes
end

