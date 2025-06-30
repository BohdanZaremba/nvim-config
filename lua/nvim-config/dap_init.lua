local dap = require("dap")

-- Godot
dap.adapters.godot = {
    type = "server",
    host = "127.0.0.1",
    port = 6006
}

dap.configurations.gdscript = {
    {
        launch_game_instance = false,
        launch_scene = false,
        name = "Launch Scene",
        project = "${workspaceFolder}",
        request = "launch",
        type = "godot"
    }
}
