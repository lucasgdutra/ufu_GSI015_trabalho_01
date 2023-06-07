interface typedStorage {
    getItem<T>(key: string): T | null;
    setItem<T>(key: string, value: T): void;
    removeItem(key: string): void;
}

let typedLocalStorage: typedStorage;

if (typeof window !== 'undefined') {
    typedLocalStorage = {
        getItem: (key) => {
            const item = window.localStorage.getItem(key);
            if (item === null || item === undefined || item === 'undefined')
                return null;
            return JSON.parse(item);
        },
        setItem: (key, value) => {
            window.localStorage.setItem(key, JSON.stringify(value));
        },
        removeItem: (key) => {
            window.localStorage.removeItem(key);
        }
    };
} else {
    // Provide a fallback or throw an error if you prefer
    typedLocalStorage = {
        getItem: () => null,
        setItem: () => { },
        removeItem: () => { },
    };
}

export default typedLocalStorage;
