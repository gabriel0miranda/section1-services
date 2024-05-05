#!/bin/lua

-- Esse script executa as seguintes tarefas, nessa sequencia:
-- - verifica a existência dos repositórios git na pasta /usr/git/repos (volume persistente)
-- - cria os repositórios listados em /usr/git_origins se não existirem
-- - inicia um cronjob que atualiza os repositórios com a origem se estiverem desatualizados
-- - disponibiliza logs importantes para stdout até receber um comando de parada

local repo_dir = "/repo"
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

function check_repos(workdir)
    local dir_list = scandir(workdir..repo_dir)
    local repo_file = assert(io.open(repo_filename, "r"))
    local lines = {}
    for line in repo_file:lines() do
      table.insert(lines, line)
    end
    repo_file:close()

    local found = 0
    for line in lines do
        for dir in dir_list do
            if line == dir then
                found = 1
                break
            end
        end
        if found == 1 then
            -- log success in finding repo           
        else
            -- execute creation of repo
        end
    end
end

