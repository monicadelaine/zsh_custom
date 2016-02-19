#!/usr/bin/zsh

export OH_MY_ZSH_HOME=${HOME}/.oh-my-zsh
export INSTALL_PROFILE=monica
plugins=`echo tmux tmuxinator common-aliases dirhistory history grep ${INSTALL_PROFILE}`
alias cp=cp

dd=`date +'%m%d_%H%M_%S'`

echo Plug ins $plugins
 
#copy custom plugins directory

tar -czf ./backup/$OH_MY_ZSH_HOMEn-my-zsh_$dd.tar.gz $OH_MY_ZSH_HOME
cp -Rv ./oh-my-zsh/${INSTALL_PROFILE} ${OH_MY_ZSH_HOME}/plugins/


# copy theme into .oh-my-zsh/themes
cp ${OH_MY_ZSH_HOME}/themes/${INSTALL_PROFILE}.zsh-theme ./backup/${INSTALL_PROFILE}.zsh-theme_$dd
cp -Rv ./oh-my-zsh/${INSTALL_PROFILE}.zsh-theme ${OH_MY_ZSH_HOME}/themes/



#link in .tmux and .tmuxinator directory
cp $HOME/.tmux.conf ./backup/tmux_conf_$dd
cp ./tmux.conf ${HOME}/.tmux.conf
tar -cvzf ./backup/tmuxinator_$dd.tar.gz ${HOME}/.tmuxinator
cp -R ./.tmuxinator ${HOME}/.tmuxinator



#set editor
export editor="vi"


#copy scripts
tar -cvzf ./backup/scripts_$dd.tar.gz ${HOME}/scripts
cp -R ./scripts/* ${HOME}/scripts/

#copy scripts
cp $HOME/.zshrc ./backup/zshrc_$dd
cp -R ./zshrc ${HOME}/.zshrc




return

#verify envs set properly
rm sed_cmds


#verify theme name is correct
if [[ ${zshrc} =~ 'ZSH_THEME=[\"]?([a-z]+)[^a-z]' ]]; then
	echo match $match[1] $MATCH[*] ${INSTALL_PROFILE}
else
	echo "no match"
fi

if [[ $match[1] != ${INSTALL_PROFILE} ]]; then
	#update theme
	echo $match[1] is not ${INSTALL_PROFILE}...updating
	echo 's/'$match[1]'/'${INSTALL_PROFILE}'/' >>sed_cmds

fi


set add=0
#verify plugins .zshrc are are correct
if [[ ${zshrc} =~ '[^ ]plugins=([\(][^\)]*[\)])' ]]; then
	echo "currently defined plugins $match[1]";
	echo $match[1] is not ${plugins}...updating
	echo 's/plugins='${MATCH[*]}'/plugins=('${plugins}')/'  >>sed_cmds
else
	echo "no plug in found"; 
	echo '$ i\
plugins=('${plugins}')' >>sed_cmds
	set add=1

fi

if [[ "$add" != "-1" ]]; then
	#update theme

fi
