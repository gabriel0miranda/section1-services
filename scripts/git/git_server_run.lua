#!/bin/lua

-- Esse script executa as seguintes tarefas, nessa sequencia:
-- - verifica a existência dos repositórios git na pasta /usr/git/repos (volume persistente)
-- - cria os repositórios listados em /usr/git_origins se não existirem
-- - inicia um cronjob que atualiza os repositórios com a origem se estiverem desatualizados
-- - disponibiliza logs importantes para stdout até receber um comando de parada

local workdir = "/usr/git"
local repo_dir = "/repo/"
local repo_filename = "git_repos"

function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

function create_repo(repo_name, repo_url)
    assert(os.execute("mkdir "..workdir..repo_dir..repo_name))
    assert(os.execute("git clone "..repo_url.." "..workdir..repo_dir..repo_name), "Git clone of "..repo_name.." didn't work!")
    return 0
end

function check_repos(appdir)
    local dir_list = scandir(appdir..repo_dir)
    local repo_file = assert(io.open(repo_filename, "r"))
    local lines = {}
    for line in repo_file:lines() do
      table.insert(lines, line)
    end
    repo_file:close()

    local found = 0
    local repo_name
    for line in lines do
        repo_name = string.sub(line, 31, -4)
        for dir in dir_list do
            if line == dir then
                found = 1
                break
            end
        end
        if found == 1 then
            print("Found repo: "..repo_name)
        else
            print("Did not find repo: "..repo_name)
            print("Creating...")
            assert(create_repo(repo_name,line), "Repo creation failed!")
        end
    end
end

function setup_cronjob(cronjob_script)
