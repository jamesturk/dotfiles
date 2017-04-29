function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
      set -g VIRTUAL_ENV_DISABLE_PROMPT true
   end

   if test $VIRTUAL_ENV
       printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
   end

   set_color 50f0e0
   printf '%s' (prompt_pwd)
   set_color normal

   set_color normal
   printf '$ '
end
