cask 'singularity-desktop-beta' do
  version '0.1'
  sha256 '90254bf3e4c4f4177a76324a587b94838c6395e36327060c441bace06a59129f'

  url "https://repo.sylabs.io/desktop/singularity-desktop-beta-v#{version}.dmg"
  name 'Singularity Desktop Beta'
  homepage 'https://sylabs.io/singularity-desktop-macos/'

  pkg "SingularityDesktop-beta-v#{version}.pkg"

  uninstall script: {
		      executable: 'uninstall.tool',
		      input:      ['Yes'],
		      sudo:       true,
		    }
end
