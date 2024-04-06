#!/usr/bin/env python3

#
# OpenLane2 build script to harden the tt_top macro inside
# the classic user_project_wrapper
#
# Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
# SPDX-License-Identifier: Apache-2.0
#

import json
import os
from typing import List

from openlane.common import get_opdks_rev
from openlane.flows.classic import Classic
from openlane.steps.odb import OdbpyStep
from openlane.steps import OpenROAD
import volare

class CustomPower(OdbpyStep):

    id = "TT.Top.CustomPower"
    name = "Custom Power connections for DFFRAM macro"

    def get_script_path(self):
        return os.path.join(
            os.path.dirname(__file__),
            "odb_power.py"
        )

    def get_command(self) -> List[str]:
        # macro = self.config["MACROS"]['I2C']
        # instance = macro.instances['i2c']
        macro = self.config["MACROS"]['RAM16']
        instance = macro.instances['debugger.core.datapath.ram.bank0']
        return super().get_command() + [
            "--macro-x-pos",
            instance.location[0],
        ]


class ProjectFlow(Classic):
  pass

if __name__ == '__main__':
    # Insert our custom step after the PDN generation
    ProjectFlow.Steps.insert(ProjectFlow.Steps.index(OpenROAD.GeneratePDN) + 1, CustomPower)

    # Temporarily disable antenna repair to avoid a segfault in openroad
    # ProjectFlow.Steps.remove(OpenROAD.RepairAntennas)

    pdk_root = volare.get_volare_home(os.getenv('PDK_ROOT'))
    volare.enable(pdk_root, "sky130", get_opdks_rev())

    flow_cfg = json.loads(open('config.json', 'r').read())

    # Run flow
    flow = ProjectFlow(
        flow_cfg,
        design_dir = ".",
        pdk_root   = pdk_root,
        pdk        = "sky130A",
    )

    flow.start(tag="wokwi")
