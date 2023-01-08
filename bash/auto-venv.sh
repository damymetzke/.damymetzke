if [ -f "$(spad-dir)/venv/bin/activate" ]
then
  VIRTUAL_ENV_DISABLE_PROMPT=1 . $(spad-dir)/venv/bin/activate
  _OLD_VIRTUAL_PS1="${PS1-}"
  PS1="$(custom_venv_prompt)"
fi
