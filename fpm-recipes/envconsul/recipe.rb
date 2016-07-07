class Envconsul < FPM::Cookery::Recipe
  name 'envconsul'

  version '0.6.1'
  revision '1'
  description 'Envconsul'

  homepage 'https://github.com/hashicorp/envconsul'
  source "https://releases.hashicorp.com/#{name}/#{version}/#{name}_#{version}_linux_amd64.zip"
  sha256 'a28cb00f02fb56fc7c5c502c95f6f696d622754d86ca069eea1f7c240d5f985f'

  maintainer 'Darron Froese <darron@froese.org>'
  vendor 'octohost'

  license 'Mozilla Public License, version 2.0'

  conflicts 'envconsul'
  replaces 'envconsul'

  build_depends 'unzip'

  def build
    safesystem "mkdir -p #{builddir}/usr/local/bin/"
    safesystem "cp -f #{builddir}/#{name}_#{version}_linux_amd64/#{name} #{builddir}/usr/local/bin/"
  end

  def install
    safesystem "mkdir -p #{destdir}/usr/local/bin/"
    safesystem "cp -f #{builddir}/usr/local/bin/#{name} #{destdir}/usr/local/bin/#{name}"
  end
end
