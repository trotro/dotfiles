import dagger
from dagger import dag, function, object_type


@object_type
class Dotfiles:
    @function
    async def shellcheck(self, source: dagger.Directory) -> str:
        """Runs shellcheck on all shell scripts in the repository via test.sh"""
        return await (
            dag.container()
            .from_("koalaman/shellcheck-alpine:stable")
            .with_exec(["sh", "-c", "apk add --no-cache file bash"])
            .with_mounted_directory("/src", source)
            .with_workdir("/src")
            .with_exec(["bash", "./test.sh"])
            .stdout()
        )
