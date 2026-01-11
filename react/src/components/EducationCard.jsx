import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { ArrowRight, Circle } from 'lucide-react';
import './EducationCard.css';

const EducationCard = ({ title, subtitle, details, link }) => {
    const [isHovered, setIsHovered] = useState(false);

    return (
        <motion.div
            className="education-card"
            onMouseEnter={() => setIsHovered(true)}
            onMouseLeave={() => setIsHovered(false)}
            animate={{
                scale: isHovered ? 1.02 : 1.0,
                backgroundColor: isHovered ? "rgba(255, 255, 255, 0.8)" : "rgba(255, 255, 255, 1)",
                borderColor: isHovered ? "rgba(103, 58, 183, 0.3)" : "rgba(224, 224, 224, 1)"
            }}
            transition={{ duration: 0.3 }}
        >
            <div className="edu-content">
                <h3 className="edu-title">{title}</h3>
                <p className="edu-subtitle">{subtitle}</p>

                {details && details.length > 0 && (
                    <div className="edu-details">
                        <div className={`edu-divider ${isHovered ? 'active' : ''}`}></div>
                        {details.map((detail, index) => (
                            <div key={index} className="edu-detail-item">
                                <Circle size={6} fill={isHovered ? "#673ab7" : "rgba(0,0,0,0.54)"} color={isHovered ? "#673ab7" : "rgba(0,0,0,0.54)"} style={{ marginTop: 6 }} />
                                <span className="edu-detail-text">{detail}</span>
                            </div>
                        ))}
                    </div>
                )}
            </div>

            <div className="edu-action">
                <a
                    href={link}
                    target="_blank"
                    rel="noopener noreferrer"
                    className={`view-detail-btn ${isHovered ? 'hovered' : ''}`}
                >
                    <span>View Detail</span>
                    <ArrowRight size={16} />
                </a>
            </div>
        </motion.div>
    );
};

export default EducationCard;
