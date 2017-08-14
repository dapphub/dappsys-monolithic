get-latest:
	wget -N 'https://raw.githubusercontent.com/dapphub/erc20/master/src/erc20.sol'
	wget -N 'https://raw.githubusercontent.com/dapphub/ds-auth/master/src/auth.sol'
	wget -N 'https://raw.githubusercontent.com/dapphub/ds-note/master/src/note.sol'
	wget -N 'https://raw.githubusercontent.com/dapphub/ds-exec/master/src/exec.sol'
	wget -N 'https://raw.githubusercontent.com/dapphub/ds-math/master/src/math.sol'
	wget -N 'https://raw.githubusercontent.com/dapphub/ds-stop/master/src/stop.sol'
	wget -N 'https://raw.githubusercontent.com/dapphub/ds-token/master/src/base.sol'
	wget -N 'https://raw.githubusercontent.com/dapphub/ds-thing/master/src/thing.sol'
	wget -N 'https://raw.githubusercontent.com/dapphub/ds-token/master/src/token.sol'
	wget -N 'https://raw.githubusercontent.com/dapphub/ds-vault/master/src/vault.sol'
	wget -N 'https://raw.githubusercontent.com/dapphub/ds-vault/master/src/multivault.sol'
	wget -N 'https://raw.githubusercontent.com/dapphub/ds-guard/master/src/guard.sol'
	wget -N 'https://raw.githubusercontent.com/dapphub/ds-roles/master/src/roles.sol'
	git add *.sol

fix-imports:
	sed -E "s#^import ['\"](ds-[[:alpha:]]*|erc20)/([[:alpha:]]*)\.sol['\"];#import \"./\2.sol\";#" *.sol -i
	sed -E "s#import ['\"]erc20/erc20.sol['\"];#import \"./erc20.sol\";#" *.sol -i

test:
	solc *.sol

upgrade: get-latest fix-imports test
	git add *.sol
	git commit -m "upgrade dappsys"
