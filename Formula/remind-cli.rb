class RemindCli < Formula
  include Language::Python::Virtualenv

  desc "AI-powered reminder CLI with smart suggestions and notifications"
  homepage "https://github.com/hamzaplojovic/remind"
  url "https://github.com/hamzaplojovic/remind/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")

    # Install workspace packages in dependency order
    venv.pip_install buildpath/"packages/shared"
    venv.pip_install buildpath/"packages/database"
    venv.pip_install buildpath/"apps/cli"

    # Link the remind binary
    bin.install_symlink libexec/"bin/remind"
  end

  test do
    assert_match "remind #{version}", shell_output("#{bin}/remind --version")
  end
end
