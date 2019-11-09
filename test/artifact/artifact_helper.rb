require "minitest/autorun"
require "open3"

TEST_CLI_OPTS="--chef-license=accept-no-persist"

class ArtifactTest < Minitest::Test
  make_my_diffs_pretty!

  def assert_artifact(inspec_command)
    command = "inspec #{inspec_command} #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3({ "PATH" => ENV["PATH"] },
                                            command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
