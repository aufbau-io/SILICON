import { writable } from 'svelte/store';

export const userType = writable(null);
export const screenType = writable(null);
export const isIframe = writable(true);
export const darkMode = writable(false);

export const lobbySelected = writable(false);
export const mouseOnLink = writable(false);

export const mousePosition = writable({ x: 0, y: 0, z: 0 });

// export const showRightSidebar = writable(true);
// export const showLeftSidebar = writable(true);

export const fullDatabaseView = writable(false);
export const showFilters = writable(false);

export const xPlane = writable({
	visible: true,
	name: 'YEAR',
	min: 1900,
	max: 2023,
	value: 1996
});

export const yPlane = writable({
	visible: true,
	name: 'INTENSITY',
	min: 0,
	max: 100,
	value: 50
});

export const zPlane = writable({
	visible: true,
	name: 'TEXTURE',
	min: 0,
	max: 100,
	value: 50
});
