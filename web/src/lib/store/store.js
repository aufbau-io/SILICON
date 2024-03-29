import { writable } from 'svelte/store';

export const userType = writable(null);
export const screenType = writable(null);
export const isIframe = writable(true);
export const darkMode = writable(true);

export const animationSpeed = writable(1.0);
export const lastAnimationSpeed = writable(1.0);

export const mousePosition = writable({ x: 0, y: 0, z: 0 });

// export const showRightSidebar = writable(true);
// export const showLeftSidebar = writable(true);

export const fullDatabaseView = writable(false);
export const showFilters = writable(false);

export const visual = writable('space');

export const xPlane = writable({
	name: 'YEAR',
	visible: true,
	min: 1900,
	max: 2023,
	value: 1996
});

export const yPlane = writable({
	name: 'INTENSITY',
	visible: true,
	min: 0,
	max: 100,
	value: 50
});

export const zPlane = writable({
	name: 'TEXTURE',
	visible: true,
	min: 0,
	max: 100,
	value: 50
});
