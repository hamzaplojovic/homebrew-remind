class RemindCli < Formula
  include Language::Python::Virtualenv

  desc "AI-powered reminder CLI with smart suggestions and notifications"
  homepage "https://pypi.org/project/remind-cli/"
  url "https://files.pythonhosted.org/packages/a3/64/44573e4f5357356b21aba1c2356f759d84498b5e41544dd2ac1cd4dcfd2a/remind_cli-1.0.0.tar.gz"
  sha256 "136fc8c0b8c91a0a9107be849fa6b2f5429c72b5f9e094548fea225c784aac35"
  license "MIT"

  depends_on "python@3.12"

  resource "remind-shared" do
    url "https://files.pythonhosted.org/packages/aa/f1/b4925993638af8c760a8be6338fbdfac1deea56b2645cb92c2e805acb298/remind_shared-1.0.0.tar.gz"
    sha256 "ab3f6bbbf5c3201fd12e7a4afda5660946b81b28ed1e673d41d71fdb55babf81"
  end

  resource "remind-database" do
    url "https://files.pythonhosted.org/packages/43/cb/d8f6f7a659aef8289214823b9c6c3437de45d05c7ed7d30795c18e1b7282/remind_database-1.0.0.tar.gz"
    sha256 "7ac65992880b121d9bf25061863d9a596425fe4ef50c061f5aa89780039896d9"
  end

  def install
    virtualenv_install_with_resources
    bin.install_symlink libexec/"bin/remind"
  end

  test do
    assert_match "remind #{version}", shell_output("#{bin}/remind --version")
  end
end
