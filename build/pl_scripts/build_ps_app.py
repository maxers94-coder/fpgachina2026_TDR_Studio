"""Vitis 2026.1 Python console build from this project's exported XSA.

Run only after build_echo_ps_system.tcl has produced the final XSA:
    D:/AMD/2026.1/Vitis/bin/vitis.bat -s Z:/scripts/build_ps_app.py
This creates a new Vitis workspace; it never reuses the old 100 MSPS domain.
"""
from pathlib import Path
import os
import vitis

# Keep the ASCII SUBST drive. Path.resolve() expands Z: to the Chinese host
# directory, which the Vitis embedded workspace server cannot create.
root = Path(__file__).absolute().parent.parent
xsa = root / "export" / "echo_ps_system.xsa"
workspace_name = os.environ.get("ECHO_VITIS_WORKSPACE", "vitis_ws_200_v3")
if not workspace_name.startswith("vitis_ws_200_") or "/" in workspace_name or "\\" in workspace_name:
    raise RuntimeError("ECHO_VITIS_WORKSPACE must be a simple vitis_ws_200_* folder name")
workspace = root / workspace_name
if not xsa.is_file():
    raise RuntimeError(f"XSA missing: {xsa}")
if workspace.exists():
    raise RuntimeError(
        f"Workspace already exists: {workspace}. Preserve it and choose a new name."
    )

client = vitis.create_client()
try:
    client.set_workspace(path=str(workspace))
    name = "echo200_platform"
    domain = "standalone_ps7_cortexa9_0"
    platform = client.create_platform_component(
        name=name,
        hw_design=str(xsa),
        os="standalone",
        cpu="ps7_cortexa9_0",
        domain_name=domain,
        generate_dtb=False,
        compiler="gcc",
    )
    platform = client.get_component(name=name)
    platform.build()
    xpfm = workspace / name / "export" / name / f"{name}.xpfm"
    if not xpfm.is_file():
        raise RuntimeError(f"Platform was not exported: {xpfm}")
    app = client.create_app_component(
        name="echo200_app", platform=str(xpfm), domain=domain
    )
    app = client.get_component(name="echo200_app")
    files = sorted(
        p.name for p in (root / "ps_app").iterdir()
        if p.suffix.lower() in (".c", ".h")
    )
    app.import_files(
        from_loc=str(root / "ps_app"), files=files, dest_dir_in_cmp="src"
    )
    app.build()
    elf = workspace / "echo200_app" / "build" / "echo200_app.elf"
    if not elf.is_file():
        raise RuntimeError(f"Vitis did not produce the PS ELF: {elf}")
    print("PS_200_APP_BUILD_PASS")
finally:
    vitis.dispose()
