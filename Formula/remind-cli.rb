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

  resource "SQLAlchemy" do
    url "https://files.pythonhosted.org/packages/06/aa/9ce0f3e7a9829ead5c8ce549392f33a12c4555a6c0609bb27d882e9c7ddf/sqlalchemy-2.0.46.tar.gz"
    sha256 "cf36851ee7219c170bb0793dbc3da3e80c582e04a5437bc601bfe8c85c9216d7"
  end

  resource "alembic" do
    url "https://files.pythonhosted.org/packages/94/13/8b084e0f2efb0275a1d534838844926f798bd766566b1375174e2448cd31/alembic-1.18.4.tar.gz"
    sha256 "cb6e1fd84b6174ab8dbb2329f86d631ba9559dd78df550b57804d607672cedbc"
  end

  resource "Mako" do
    url "https://files.pythonhosted.org/packages/9e/38/bd5b78a920a64d708fe6bc8e0a2c075e1389d53bef8413725c63ba041535/mako-1.3.10.tar.gz"
    sha256 "99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28"
  end

  resource "psycopg" do
    url "https://files.pythonhosted.org/packages/e0/1a/7d9ef4fdc13ef7f15b934c393edc97a35c281bb7d3c3329fbfcbe915a7c2/psycopg-3.3.2.tar.gz"
    sha256 "707a67975ee214d200511177a6a80e56e654754c9afca06a7194ea6bbfde9ca7"
  end

  resource "dateparser" do
    url "https://files.pythonhosted.org/packages/3d/2c/668dfb8c073a5dde3efb80fa382de1502e3b14002fd386a8c1b0b49e92a9/dateparser-1.3.0.tar.gz"
    sha256 "5bccf5d1ec6785e5be71cc7ec80f014575a09b4923e762f850e57443bddbf1a5"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/f8/bf/abbd3cdfb8fbc7fb3d4d38d320f2441b1e7cbe29be4f23797b4a2b5d8aac/pytz-2025.2.tar.gz"
    sha256 "360b9e3dbb49a209c21ad61809c7fb453643e048b38924c765813546746e81c3"
  end

  resource "regex" do
    url "https://files.pythonhosted.org/packages/0b/86/07d5056945f9ec4590b518171c4254a5925832eb727b56d3c38a7476f316/regex-2026.1.15.tar.gz"
    sha256 "164759aa25575cbc0651bef59a0b18353e54300d79ace8084c818ad8ac72b7d5"
  end

  resource "notify-py" do
    url "https://files.pythonhosted.org/packages/06/2b/fc68aeed5108185922c5469484e15c192dff01d61eddfab0c1c256e4f54c/notify_py-0.3.43.tar.gz"
    sha256 "16ee146d48f16bae5dad233db66014a387efd2c6ed2c4caf1e08aef432070513"
  end

  resource "loguru" do
    url "https://files.pythonhosted.org/packages/75/1f/d3818863e4be96bd641c4643c535a98f0fa2a12efa7c8ba35f763fa778ee/loguru-0.6.0.tar.gz"
    sha256 "066bd06758d0a513e9836fd9c6b5a75bfb3fd36841f4b996bc60b547a309d41c"
  end

  resource "pydantic-settings" do
    url "https://files.pythonhosted.org/packages/43/4b/ac7e0aae12027748076d72a8764ff1c9d82ca75a7a52622e67ed3f765c54/pydantic_settings-2.12.0.tar.gz"
    sha256 "005538ef951e3c2a68e1c08b292b5f2e71490def8589d4221b95dab00dafcfd0"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/55/e3/70399cb7dd41c10ac53367ae42139cf4b1ca5f36bb3dc6c9d33acdb43655/typing_inspection-0.4.2.tar.gz"
    sha256 "ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/ec/fe/802052aecb21e3797b8f7902564ab6ea0d60ff8ca23952079064155d1ae1/tabulate-0.9.0.tar.gz"
    sha256 "0095b12bf5966de529c0feb1fa08671671b3368eec77d7ef7ab114be2c068b3c"
  end

  def install
    virtualenv_install_with_resources
    bin.install_symlink libexec/"bin/remind"
  end

  test do
    assert_match "remind #{version}", shell_output("#{bin}/remind --version")
  end
end
