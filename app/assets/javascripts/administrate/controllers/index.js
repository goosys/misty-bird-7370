import { application } from "administrate/controllers/application";

import SelectController from "administrate/controllers/select_controller";
import TableController from "administrate/controllers/table_controller";
import TooltipController from "administrate/controllers/tooltip_controller";

application.register("select", SelectController);
application.register("table", TableController);
application.register("tooltip", TooltipController);
