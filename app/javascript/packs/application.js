import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initBanner } from '../plugins/init_banner';

import { initWizard } from '../plugins/init_wizard';

initBanner();
initMapbox();
initWizard();
