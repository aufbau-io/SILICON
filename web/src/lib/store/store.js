import { writable } from 'svelte/store';

export const userType = writable(null);
export const screenType = writable(null);
export const isIframe = writable(true);
export const darkMode = writable(false);

export const lobbySelected = writable(false);
export const mouseOnLink = writable(false);

export const mousePosition = writable({ x: 0, y: 0, z: 0 });

export const xPlane = writable({
	min: 0,
	max: 1,
	value: 0.5
});

export const yPlane = writable({
	min: 0,
	max: 1,
	value: 0.5
});

export const zPlane = writable({
	min: 0,
	max: 1,
	value: 0.5
});
