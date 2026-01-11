import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { X, ChevronLeft, ChevronRight } from 'lucide-react';
import './AutoScrollingGallery.css';

const AutoScrollingGallery = ({ photos, name }) => {
    const [isLightTheme, setIsLightTheme] = useState(true);
    const [lightboxOpen, setLightboxOpen] = useState(false);
    const [initialIndex, setInitialIndex] = useState(0);

    const getFilteredPhotos = () => {
        if (name === "Daily Telly") {
            return isLightTheme
                ? (photos.length >= 14 ? photos.slice(0, 14) : photos)
                : (photos.length > 14 ? photos.slice(14) : []);
        } else if (name === "Rangtarang") {
            return isLightTheme
                ? (photos.length >= 7 ? photos.slice(0, 7) : photos)
                : (photos.length > 7 ? photos.slice(7) : []);
        }
        return photos;
    };

    const filteredPhotos = getFilteredPhotos();

    // Create rows for scrolling
    const rows = [[], [], []];
    if (filteredPhotos.length > 0) {
        if (filteredPhotos.length < 9) {
            rows[0] = [...filteredPhotos];
            rows[1] = [...filteredPhotos.slice(1), ...filteredPhotos.slice(0, 1)];
            rows[2] = filteredPhotos.length > 1 ? [...filteredPhotos.slice(2), ...filteredPhotos.slice(0, 2)] : [...filteredPhotos];
        } else {
            filteredPhotos.forEach((photo, i) => {
                rows[i % 3].push(photo);
            });
        }
    }

    const isDesktopProject = name === "Rangtarang" || name === "Angel Motors" || name === "Maa Swasth Admin Panel";

    const openLightbox = (index) => {
        // Find absolute index in original photos array
        const photoUrl = filteredPhotos[index]; // This logic might need adjustment if rows are shuffled
        // For simplicity, let's just use the filtered list for lightbox navigation
        setInitialIndex(index);
        setLightboxOpen(true);
    };

    return (
        <div className="auto-gallery">
            {(name === "Daily Telly" || name === "Rangtarang") && (
                <div className="theme-toggle">
                    <button
                        className={`theme-chip ${isLightTheme ? 'active' : ''}`}
                        onClick={() => setIsLightTheme(true)}
                    >
                        Light
                    </button>
                    <button
                        className={`theme-chip ${!isLightTheme ? 'active' : ''}`}
                        onClick={() => setIsLightTheme(false)}
                    >
                        Dark
                    </button>
                </div>
            )}

            <div className="gallery-rows">
                {rows.map((rowPhotos, rowIndex) => (
                    rowPhotos.length > 0 && (
                        <div key={rowIndex} className="gallery-row-wrapper">
                            <div className={`gallery-track ${rowIndex === 1 ? 'reverse' : 'normal'}`}>
                                {/* Original Set */}
                                {rowPhotos.map((photo, index) => (
                                    <div
                                        key={`orig-${index}`}
                                        className={`gallery-item ${isDesktopProject ? 'desktop' : 'mobile'} ${name === "Angel Motors" ? 'wide' : ''}`}
                                        onClick={() => openLightbox(filteredPhotos.indexOf(photo))}
                                    >
                                        <img src={photo} alt={`Screenshot ${index}`} />
                                    </div>
                                ))}
                                {/* Duplicate Set for Infinite Scroll */}
                                {rowPhotos.map((photo, index) => (
                                    <div
                                        key={`dup-${index}`}
                                        className={`gallery-item ${isDesktopProject ? 'desktop' : 'mobile'} ${name === "Angel Motors" ? 'wide' : ''}`}
                                        onClick={() => openLightbox(filteredPhotos.indexOf(photo))}
                                    >
                                        <img src={photo} alt={`Screenshot ${index}`} />
                                    </div>
                                ))}
                                {/* Triplicate Set for smoother loop on wide screens */}
                                {rowPhotos.map((photo, index) => (
                                    <div
                                        key={`tri-${index}`}
                                        className={`gallery-item ${isDesktopProject ? 'desktop' : 'mobile'} ${name === "Angel Motors" ? 'wide' : ''}`}
                                        onClick={() => openLightbox(filteredPhotos.indexOf(photo))}
                                    >
                                        <img src={photo} alt={`Screenshot ${index}`} />
                                    </div>
                                ))}
                            </div>
                        </div>
                    )
                ))}
            </div>

            <AnimatePresence>
                {lightboxOpen && (
                    <Lightbox
                        images={filteredPhotos}
                        initialIndex={initialIndex}
                        onClose={() => setLightboxOpen(false)}
                    />
                )}
            </AnimatePresence>
        </div>
    );
};

const Lightbox = ({ images, initialIndex, onClose }) => {
    const [currentIndex, setCurrentIndex] = useState(initialIndex);

    const nextImage = (e) => {
        e.stopPropagation();
        if (currentIndex < images.length - 1) {
            setCurrentIndex(currentIndex + 1);
        }
    };

    const prevImage = (e) => {
        e.stopPropagation();
        if (currentIndex > 0) {
            setCurrentIndex(currentIndex - 1);
        }
    };

    return (
        <motion.div
            className="lightbox-overlay"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
        >
            <button className="lightbox-close" onClick={onClose}>
                <X size={30} color="white" />
            </button>

            <div className="lightbox-content" onClick={(e) => e.stopPropagation()}>
                <img src={images[currentIndex]} alt="Gallery" className="lightbox-img" />
            </div>

            {images.length > 1 && (
                <div className="lightbox-controls">
                    {currentIndex > 0 && (
                        <button className="lightbox-nav prev" onClick={prevImage}>
                            <ChevronLeft size={30} color="white" />
                        </button>
                    )}

                    <div className="lightbox-indicator">
                        {currentIndex + 1} / {images.length}
                    </div>

                    {currentIndex < images.length - 1 && (
                        <button className="lightbox-nav next" onClick={nextImage}>
                            <ChevronRight size={30} color="white" />
                        </button>
                    )}
                </div>
            )}
        </motion.div>
    );
};

export default AutoScrollingGallery;
