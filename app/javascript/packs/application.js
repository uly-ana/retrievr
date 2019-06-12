import "bootstrap";
import "mapbox-gl/dist/mapbox-gl.css";

import { dropdownFilter } from 'components/dropdown_filter';
import { reviewShow } from 'components/new_review';
import { initMapbox } from '../plugins/init_mapbox';
import { redOnClick } from 'components/favorite_red';
// import { goStripe } from '../plugins/init_stripe';

dropdownFilter();
reviewShow();
initMapbox();
redOnClick();
// goStripe();